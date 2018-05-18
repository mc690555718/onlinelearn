package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016082000291689";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC5y6uCfrgLGm5g4YlsQhQlVJZr8qP8cNVQ8GyNErmzyl4xGkTUxMkUKZyb4lxHTpdx0vVxSVsCBXcXZT6G1jNvkxsXMRzN5fxRS5OlaslAIC9aJa4DekXH5MThs+WztF27CXtj10aQD6l0l3O2l449WZqA4PKOCkTyLO0E7ez2sV4wEpSA7U2vYN1m+EnyAj62oD/NPy+RdOggKmTblwNts7K3UzeN6kmaHuoa1A4Qt0peB6kA56Hekvmkgii7FzV31XeA3U2etqMDtFzNF4G4678wYKlWhIYFBG5g/vRfYHmsC4FRpKx3sVeP0R2ki+ov1YGAShhBsZaFoEQs/kxZAgMBAAECggEBAKbfROXpxodCcAzXxMPU/Z8hwBCoV5zuAsm1humV/fB7O+pCO7wWGrvfO+fOgS8SaXc0EHp1diX0nqgGqQgV7xCxQU2tML/FZr/lb3DM3oCX56/B0+8PrQkCccp99ztWLjFFLOvZeGj/iCVNugIvUPPNPLWwVGo60v3oV+FriL9vtzZL4tK0rdZ9HAHq7hjgtQ07tgfrd8X9UVYfET5oZ5vgJEZ8uhReQcEtoxSZ74dWSgwLcRWjCiylFnrN9UQBCv26+BCsi+4zSfsn77w/T2aRzSeNZp2eK4reZVTTr7ATU1GlFHc/XLhu0eaOATcZtudbr8ZYn+3WxBJhPt09zOECgYEA+mEQQB6jTPh/JzTSnPyVsWGbJkoY9/o9tvM4zaWMO49FYBtTjna585/pfwTR1YoXVA7T4dqO5oS8kk4+ApSRlGUYVyFMEmJkj4hs9BRcNmkIK1j2erObJr5+7F5bwRiV+DldVoe7kZmx+oqhTnaq7fC0a2WCPo3yI9dgW/SjX+UCgYEAvfdxWZmw1y7+F5YfGYF419VZ+yF18nwmgMJED+cHNuAg0fDzYn2F4hnWn3vKuZpwvd+PyKQmVatGOWkNetZf2RzxK1olRiYVGaNVxB9m5WCIRcSq4SW7FVpLBQBlybk69cZkIqVKmr3wAmdqzV+1GjLsRiL0kTVZg0oZqfbWK2UCgYBfQTAyhLVx4hRV8SWzbfDxVAX3sjb/mKeEA9J3gmTwf9hP8PV//LFP+2WU2luOVwP7Cc0YXtMA5jzrmHLE/orIHxH8jAFp+R7y8F8rGNfgJ2NhQm47TjtXqR+Wg2t68gSUNBbLhcYZZZStkbI+rKzo6ytotGyxqcUWV6kkMtU49QKBgHDqYvLaWvYdFaWZcxTrE5RfWePfKMegqhZA4sn9Dhm9MWT47wJtECasKxmTMJYQSdFi0Il3oN2tN8mqOvv37vMTs/qL07oVqtcZckJoU/Yl4fpugw/fKIvxpsPrT5WPR4+NhDnfvC+slLwpEp/OssxG1pB9+JdTeciDRCv176nNAoGBAIDqurBBRvrB9RQE5s3wOVynPGXn/zJsh1lvG8iraLnYuCN8Xwy2b7Fz6o14vTFWZs09TOya44x+xh0op6Sp+MFgXlMUUTcaWpl0aauAPngiG58gTQYIJL6bAMJhwlVr0+dKnYml9iXZgyYLVAOndeDxFlEDBBDQwipw/1/64Dhx";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4eb0EK6DUABPxq/34zptQMQIy+SPdoUue9BziaNhT2SC0t4iB95FfPrCrH42aQRPhLDK4OWmdqbBDW7hUlTnOLD7QXFn6FndhxUjissUtvHKvYvPqK7F7CH97f8LKP5czzRHBjwPhpE8OxgiwEpnJJr5nsUjx2neXKogQuBBbmQFmSuhZyEIgrwz52xAQIOIp/gv5dIwrpPAKDivNPOLqmW+BzEVa5stmP5DmQ+tDsIZs3yQq+hXZPdE6s6bZxD13fbCgVOFeNS2o3qj/SDA1Tqqt1gaNR7Xaa8hbZYjFgynCUtYfhyo9vkYnzN2TJWuFX2f7YUwLK2/fR3frQTEGwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/front/Alipay/notify_url";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/front/Alipay/return_url";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

