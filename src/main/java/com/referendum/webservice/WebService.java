package com.referendum.webservice;

import static spark.Spark.get;
import static spark.Spark.port;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;




import spark.Spark;
import spark.utils.GzipUtils;

import com.referendum.DataSources;
import com.referendum.tools.Tools;



public class WebService {
	static final Logger log = LoggerFactory.getLogger(WebService.class);

	
	
	public static void start() {
		

//		Spark.secure(DataSources.KEYSTORE(), "foobar",null,null);


		if (DataSources.SSL) {
			Spark.secure(DataSources.KEYSTORE_FILE(), "changeit", null,null);
		}
		
		port(DataSources.INTERNAL_SPARK_WEB_PORT);
		
		API.setup();
		DynamicPages.setup();
	
		get("/hello", (req, res) -> {
			Tools.allowOnlyLocalHeaders(req, res);
			return "hi from the referendum web service";
		});
		
		
		get("/", (req, res) -> {
			Tools.allowAllHeaders(req, res);
			Tools.set15MinuteCache(req, res);
			
			return Tools.readFile(DataSources.BASE_ENDPOINT);
		});
				
		
		get("/*", (req, res) -> {
			Tools.allowAllHeaders(req, res);
			Tools.set15MinuteCache(req, res);
			
			String pageName = req.splat()[0];
			
			String webHomePath = DataSources.WEB_HOME() + "/" + pageName;
			
			Tools.setContentTypeFromFileName(pageName, res);
			
			return Tools.writeFileToResponse(webHomePath, req, res);

		});

		
	}
}
