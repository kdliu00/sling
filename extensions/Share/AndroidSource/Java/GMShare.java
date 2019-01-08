package ${YYAndroidPackageName};

import java.io.File;
import java.io.InputStream;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import android.R;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Handler;
import android.text.Html;
import android.util.Log;
import android.view.View;
import android.webkit.MimeTypeMap;
import android.support.v4.content.FileProvider;

@SuppressWarnings("deprecation")
public class GMShare extends RunnerSocial {

    public static final int REQUEST_CODE = 1;

    public static int sdk = 0;
    public static Activity activity = null;
    public static View rootView = null;
    public static Handler viewHandler = null;
    public static String gmshare_dialogTitle;
    public static Intent gmshare_intent = null;
    public static String gmshare_extText = "";
    public static String gmshare_extSubject = "";
    public static ArrayList<Uri> gmshare_extFiles = null;
    public static String gmshare_extType = "";
    public static boolean gmshare_extHasDocuments = false;
    public static ArrayList<String> gmshare_extRecipients = null;
    public static String gmshare_extPackageNameStartsWith = "";
    public static boolean gmshare_extIsSMS = false;
    public static boolean gmshare_extIsEmail = false;
    public static boolean gmshare_extBodyIsHTML = false;
    public static String gmshare_extIntentAction = android.content.Intent.ACTION_SEND;
    public static boolean gmshare_didFinish = false;
    public static boolean gmshare_completed = false;

    public void share_init() {
        //Log.i("yoyo", "share_init");
        sdk = android.os.Build.VERSION.SDK_INT;
        activity = RunnerActivity.CurrentActivity;
        rootView = activity.findViewById(android.R.id.content);
        viewHandler = RunnerActivity.ViewHandler;
        gmshare_dialogTitle = "Share using";
        gmshare_extFiles = new ArrayList<Uri>();
        gmshare_extRecipients = new ArrayList<String>();
    }

    public void share_text(String text) {
        //Log.i("yoyo", "share_text");
        share_text_ext(text, "", "");
    }

    public void share_text_ext(String text, String subject, String email) {
        //Log.i("yoyo", "share_text_ext");
        gmshare_intent = new Intent(android.content.Intent.ACTION_SEND);
        gmshare_intent.setType("text/plain");
        if (!subject.isEmpty()) {
            gmshare_intent.putExtra(android.content.Intent.EXTRA_SUBJECT, subject);
        }
        if (!email.isEmpty()) {
            gmshare_intent.putExtra(android.content.Intent.EXTRA_EMAIL, email);
        }
        gmshare_intent.putExtra(android.content.Intent.EXTRA_TEXT, text);
        startIntent(true);
    }

    public void share_url(String url) {
        //Log.i("yoyo", "share_url");
        share_text(url);
    }

    public void share_image(String filename) {
        //Log.i("yoyo", "share_image");
        share_file(filename);
    }

    public void share_file(String filename) {
        //Log.i("yoyo", "share_file");
        gmshare_intent = new Intent(android.content.Intent.ACTION_SEND);
        gmshare_intent.setType(getMimeType(filename));
        gmshare_intent.putExtra(android.content.Intent.EXTRA_STREAM, getFileUri(filename));
        startIntent(true);
    }

    public void share_set_popover_origin(double x, double y) {
        //Log.i("yoyo", "share_set_popover_origin");
    }

    public void share_set_popover_region(double x, double y, double width, double height) {
        //Log.i("yoyo", "share_set_popover_region");
    }

    public void share_set_dialog_title(String title) {
        //Log.i("yoyo", "share_set_dialog_title");
        gmshare_dialogTitle = title;
    }

    public double share_did_finish() {
        //Log.i("yoyo", "share_did_finish");
        if (gmshare_didFinish) {
            gmshare_didFinish = false;
            return 1;
        }
        return 0;
    }

    public double share_get_completed() {
        //Log.i("yoyo", "share_get_completed");
        if (gmshare_completed) {
            return 1;
        }
        return 0;
    }

    public double share_get_chosen_activity() {
        //Log.i("yoyo", "share_get_chosen_activity");
        return -1;
    }

    public String share_get_chosen_activity_string() {
        //Log.i("yoyo", "share_get_chosen_activity_string");
        return "";
    }

    public void share_ext_prepare() {
        //Log.i("yoyo", "share_ext_prepare");
        gmshare_extText = "";
        gmshare_extSubject = "";
        gmshare_extFiles.clear();
        gmshare_extType = "";
        gmshare_extHasDocuments = false;
        gmshare_extRecipients.clear();
        gmshare_extPackageNameStartsWith = "";
        gmshare_extIsSMS = false;
        gmshare_extIsEmail = false;
        gmshare_extBodyIsHTML = false;
        gmshare_extIntentAction = android.content.Intent.ACTION_SEND;
    }

    public void share_ext_add_text(String text) {
        //Log.i("yoyo", "share_ext_add_text");
        if (gmshare_extText.length() == 0) {
            gmshare_extText = text;
        }
        else {
            gmshare_extText = gmshare_extText + " " + text;
        }
    }

    public void share_ext_add_url(String url) {
        //Log.i("yoyo", "share_ext_add_url");
        share_ext_add_text(url);
    }

    public void share_ext_add_image(String filename) {
        //Log.i("yoyo", "share_ext_add_image");
        String mimeType = getMimeType(filename);
        if (gmshare_extFiles.size() == 0 || mimeType.equals(gmshare_extType)) {
            gmshare_extType = mimeType;
        }
        else if (!gmshare_extHasDocuments) {
            gmshare_extType = "image/*";
        }
        else {
            gmshare_extType = "*/*";
        }
        gmshare_extFiles.add(getFileUri(filename));
    }

    public void share_ext_add_file(String filename) {
        //Log.i("yoyo", "share_ext_add_file");
        String mimeType = getMimeType(filename);
        if (gmshare_extFiles.size() == 0 || mimeType.equals(gmshare_extType)) {
            gmshare_extType = mimeType;
        }
        else {
            gmshare_extType = "*/*";
        }
        gmshare_extFiles.add(getFileUri(filename));
        gmshare_extHasDocuments = true;
    }

    public void share_ext_set_activity(double activityType) {
        //Log.i("yoyo", "share_ext_set_activity");
        gmshare_extPackageNameStartsWith = "";
        gmshare_extIsSMS = false;
        gmshare_extIsEmail = false;
        switch ((int)activityType) {
            case 0:
                gmshare_extPackageNameStartsWith = "com.facebook.katana";
                break;
            case 1:
                gmshare_extPackageNameStartsWith = "com.twitter.android";
                break;
            case 3:
                gmshare_extIsSMS = true;
                break;
            case 4:
                gmshare_extIsEmail = true;
                break;
            default:
                break;
        }
    }

    public void share_ext_exclude_activity(double activityType) {
        //Log.i("yoyo", "share_ext_exclude_activity");
    }

    public void share_ext_set_subject(String subject) {
        //Log.i("yoyo", "share_ext_set_subject");
        gmshare_extSubject = subject;
    }

    public void share_ext_add_recipient(String email) {
        //Log.i("yoyo", "share_ext_add_recipient");
        gmshare_extRecipients.add(email);
    }

    public void share_ext_set_body_is_html(double isHTML) {
        //Log.i("yoyo", "share_ext_set_body_is_html");
        gmshare_extBodyIsHTML = false;
        if (isHTML == 1) {
            gmshare_extBodyIsHTML = true;
        }
    }

    public void share_ext_set_intent_action(double intentAction) {
        //Log.i("yoyo", "share_ext_set_intent_action");
        gmshare_extIntentAction = android.content.Intent.ACTION_SEND;
        if (intentAction == 1) {
            gmshare_extIntentAction = android.content.Intent.ACTION_VIEW;
        }
    }

    public double share_ext_launch() {
        //Log.i("yoyo", "share_ext_launch");
        gmshare_intent = new Intent(gmshare_extIntentAction);
        gmshare_intent.setType("text/plain");
        if (gmshare_extIsEmail) {
            gmshare_intent.setType("message/rfc822");
        }
        if (gmshare_extIsSMS) {
            gmshare_intent.setAction(android.content.Intent.ACTION_VIEW);
            gmshare_intent.setType("vnd.android-dir/mms-sms");
            gmshare_intent.putExtra("sms_body", gmshare_extText);
        }
        else if (gmshare_extBodyIsHTML) {
            gmshare_intent.putExtra(android.content.Intent.EXTRA_TEXT, Html.fromHtml(gmshare_extText));
        }
        else {
            gmshare_intent.putExtra(android.content.Intent.EXTRA_TEXT, gmshare_extText);
        }
        if (gmshare_extSubject.length() > 0) {
            gmshare_intent.putExtra(android.content.Intent.EXTRA_SUBJECT, gmshare_extSubject);
        }
        if (gmshare_extRecipients.size() > 0) {
            String [] emailAddresses = gmshare_extRecipients.toArray(new String[gmshare_extRecipients.size()]);
            gmshare_intent.putExtra(android.content.Intent.EXTRA_EMAIL, emailAddresses);
        }
        if (gmshare_extFiles.size() > 0) {
            if (!gmshare_extIsSMS && !gmshare_extIsEmail) {
                gmshare_intent.setType(gmshare_extType);
            }
            if (gmshare_extFiles.size() == 1) {
                if (!gmshare_extIsSMS && !gmshare_extIsEmail && gmshare_extIntentAction.equals(android.content.Intent.ACTION_VIEW)) {
                    gmshare_intent.setData(gmshare_extFiles.get(0));
                }
                else {
                    gmshare_intent.putExtra(android.content.Intent.EXTRA_STREAM, gmshare_extFiles.get(0));
                }
            }
            else {
                gmshare_intent.setAction(android.content.Intent.ACTION_SEND_MULTIPLE);
                gmshare_intent.putParcelableArrayListExtra(android.content.Intent.EXTRA_STREAM, gmshare_extFiles);
            }
            gmshare_intent.setFlags(android.content.Intent.FLAG_GRANT_READ_URI_PERMISSION);
        }
        if (!gmshare_extPackageNameStartsWith.isEmpty()) {
            List<ResolveInfo> matches = activity.getPackageManager().queryIntentActivities(gmshare_intent, 0);
            for (ResolveInfo info : matches) {
                if (info.activityInfo.packageName.toLowerCase().startsWith(gmshare_extPackageNameStartsWith)) {
                    gmshare_intent.setPackage(info.activityInfo.packageName);
                    startIntent(false);
                    return 1;
                }
            }
            return 0;
        }
        startIntent(true);
        return 1;
    }

    public void copyFile(File src, File dst) throws IOException {
        InputStream in = new FileInputStream(src);
        OutputStream out = new FileOutputStream(dst);
        byte[] buf = new byte[1024];
        int len;
        while ((len = in.read(buf)) > 0) {
            out.write(buf, 0, len);
        }
        in.close();
        out.close();
    }

    public Uri getFileUri(String filename) {
        String path = activity.getFilesDir().getAbsolutePath() + "/";
        File file = new File(path + filename);
        file.setReadable(true, false);
        String newPath = path + "share/";
        File newFolder = new File(newPath);
        if (newFolder.isFile()) {
            newFolder.delete();
        }
        if (!newFolder.exists()) {
            newFolder.mkdir();
        }
        File newFile = new File(newPath + filename);
        if (newFile.exists()) {
            newFile.delete();
        }
        try {
            copyFile(file, newFile);
        }
        catch (IOException exception) {
            Log.i("yoyo", "IOException trying to copy file");
        }
        return FileProvider.getUriForFile(activity, activity.getPackageName() + ".fileprovider", newFile);
    }

    public String getFileExtension(String filename) {
        int lastDotIndex = filename.lastIndexOf(".");
        if (lastDotIndex == -1) {
            return "";
        }
        return filename.substring(lastDotIndex + 1).toLowerCase();
    }

    public String getMimeType(String filename) {
        String type = MimeTypeMap.getSingleton().getMimeTypeFromExtension(getFileExtension(filename));
        if (type != null && !type.isEmpty()) {
            return type;
        }
        return "*/*";
    }

    public void startIntent(boolean chooser) {
        gmshare_didFinish = false;
        gmshare_completed = false;
        Intent intent = gmshare_intent;
        if (chooser) {
            intent = android.content.Intent.createChooser(gmshare_intent, gmshare_dialogTitle);
        }
        activity.startActivityForResult(intent, REQUEST_CODE);
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_CODE) {
            gmshare_didFinish = true;
            gmshare_completed = false;
            if (resultCode == Activity.RESULT_OK) {
                gmshare_completed = true;
            }
        }
    }

}