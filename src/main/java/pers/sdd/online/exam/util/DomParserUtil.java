package pers.sdd.online.exam.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.DOMReader;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import lombok.Cleanup;
import pers.sdd.online.exam.bean.JudeTopicBean;
import pers.sdd.online.exam.bean.SelectTopicBean;
import pers.sdd.online.exam.java.bean.LocalPaperBean;

public class DomParserUtil {

	public static void saveXMLFile(Document document, String savePath) throws IOException {
		File file = new File(savePath);
		file.createNewFile();

		@Cleanup
		PrintWriter printWriter = new PrintWriter(file);
		@Cleanup
		XMLWriter xmlWriter = new XMLWriter(printWriter);

		xmlWriter.write(document);
	}

	public static Document generatePaperXML(LocalPaperBean paper) {
		Document doc = DocumentHelper.createDocument();
		Element root = doc.addElement("resource");

		if (paper.getSelectTopicList() != null) {
			Element select = root.addElement("select");
			for (SelectTopicBean bean : paper.getSelectTopicList()) {
				Element topic = select.addElement("topic");

				topic.addElement("top-content").setText(bean.getTopContent());
				topic.addElement("result-1").setText(bean.getRes1());
				topic.addElement("result-2").setText(bean.getRes2());
				topic.addElement("result-3").setText(bean.getRes3());
				if (bean.getRes4() != null) {
					topic.addElement("result-4").setText(bean.getRes4());
				}
				topic.addElement("result-true").setText(new Integer(bean.getResTrue()).toString());
			}
		}

		if (paper.getJudgeTopicList() != null) {
			Element judge = root.addElement("judge");
			for (JudeTopicBean bean : paper.getJudgeTopicList()) {
				Element topic = judge.addElement("topic");

				topic.addElement("top-content").setText(bean.getTopContent());
				topic.addElement("result-true").setText(bean.getResult() == true ? "true" : "false");
			}
		}

		return doc;
	}

	public static LocalPaperBean parseLocalPaper(String filePath) throws Exception {
		LocalPaperBean paper = new LocalPaperBean();

		SAXReader reader = new SAXReader();
		@Cleanup
		FileInputStream fis = new FileInputStream(new File(filePath));
		Document document = reader.read(fis);
		Element root = document.getRootElement();

		Element judge = root.element("judge");
		if (judge != null) {
			paper.setJudgeTopicList(new ArrayList<JudeTopicBean>());
			Iterator<Element> topics = judge.elementIterator();
			while (topics.hasNext()) {
				Element topic = topics.next();
				paper.getJudgeTopicList().add(new JudeTopicBean(topic.elementText("top-content"),
						Boolean.parseBoolean(topic.elementText("result-true"))));
			}
		}

		Element select = root.element("select");
		if (select != null) {
			paper.setSelectTopicList(new ArrayList<SelectTopicBean>());
			Iterator<Element> topics = select.elementIterator();
			while (topics.hasNext()) {
				Element topic = topics.next();
				paper.getSelectTopicList()
						.add(new SelectTopicBean(topic.elementText("top-content"), topic.elementText("result-1"),
								topic.elementText("result-2"), topic.elementText("result-3"),
								topic.elementText("result-4"), Integer.parseInt(topic.elementText("result-true"))));
			}
		}

		return paper;
	}

	public static boolean vertifyParseLocalPaper(String filePath) {
		LocalPaperBean paper = new LocalPaperBean();

		SAXReader reader = new SAXReader();
		Document document = null;
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(new File(filePath));
			document = reader.read(fis);
		} catch (DocumentException e1) {
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return false;
		} catch (FileNotFoundException e) {
			try {
				fis.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return false;
		}
		Element root = document.getRootElement();

		try {
			Element judge = root.element("judge");
			if (judge != null) {
				paper.setJudgeTopicList(new ArrayList<JudeTopicBean>());
				Iterator<Element> topics = judge.elementIterator();
				while (topics.hasNext()) {
					Element topic = topics.next();
					paper.getJudgeTopicList().add(new JudeTopicBean(topic.elementText("top-content"),
							Boolean.parseBoolean(topic.elementText("result-true"))));
				}
			}

			Element select = root.element("select");
			if (select != null) {
				paper.setSelectTopicList(new ArrayList<SelectTopicBean>());
				Iterator<Element> topics = select.elementIterator();
				while (topics.hasNext()) {
					Element topic = topics.next();
					paper.getSelectTopicList()
							.add(new SelectTopicBean(topic.elementText("top-content"), topic.elementText("result-1"),
									topic.elementText("result-2"), topic.elementText("result-3"),
									topic.elementText("result-4"), Integer.parseInt(topic.elementText("result-true"))));
				}
			}
			if (select == null && judge == null) {
				return false;
			}
		} catch (Exception e) {
			try {
				fis.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return false;
		}
		return true;

	}

}
