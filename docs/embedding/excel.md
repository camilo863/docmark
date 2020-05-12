## Onedrive Embed

The quick and easy method is all that works now.

1. In a browser go to your https://onedrive.live.com and right click on the Excel file and then select embed.
2. Click 'generate' button.
3. At bottom of panel click `Customize how this embedded workbook`.
4. In new window copy the `iframe` or the `javascript` or tab next to "Embed Code" above the textbox.

**simple ifram example**

```html
<iframe width="402" height="346" frameborder="0" scrolling="no" src="https://onedrive.live.com/embed?resid=F4E541E7F8747E1B%21395&authkey=%21AAg4KxjLcMu-9W0&em=2&wdAllowInteractivity=False&wdHideHeaders=True&wdInConfigurator=True"></iframe>
```

Will render as follows ...

<iframe width="402" height="346" frameborder="0" scrolling="no" src="https://onedrive.live.com/embed?resid=F4E541E7F8747E1B%21395&authkey=%21AAg4KxjLcMu-9W0&em=2&wdAllowInteractivity=False&wdHideHeaders=True&wdInConfigurator=True"></iframe>


And the javascript is a bit cleaner and you can tweak settings
```html
<div id="myExcelDiv" style="width: 600px; height: 420px"></div>
<!-- * This code uses the Microsoft Office Excel Javascript object model to programmatically insert the
	 * Excel Web App into a div with id=myExcelDiv. The full API is documented at
	 * https://msdn.microsoft.com/en-US/library/hh315812.aspx. There you can find out how to programmatically get
	 * values from your Excel file and how to use the rest of the object model. -->
<script type="text/javascript" src="https://onedrive.live.com/embed?resid=F4E541E7F8747E1B%21395&authkey=%21AAg4KxjLcMu-9W0&em=3&wdDivId=%22myExcelDiv%22&wdHideHeaders=1&wdAllowInteractivity=0"></script>
```
<div id="myExcelDiv" style="width: 600px; height: 420px"></div>
<!-- * This code uses the Microsoft Office Excel Javascript object model to programmatically insert the
	 * Excel Web App into a div with id=myExcelDiv. The full API is documented at
	 * https://msdn.microsoft.com/en-US/library/hh315812.aspx. There you can find out how to programmatically get
	 * values from your Excel file and how to use the rest of the object model. -->
<script type="text/javascript" src="https://onedrive.live.com/embed?resid=F4E541E7F8747E1B%21395&authkey=%21AAg4KxjLcMu-9W0&em=3&wdDivId=%22myExcelDiv%22&wdHideHeaders=1&wdAllowInteractivity=0"></script>
