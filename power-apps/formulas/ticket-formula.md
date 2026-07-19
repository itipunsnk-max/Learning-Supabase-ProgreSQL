# Power Apps Formulas

## Submit Ticket

```powerfx
If(
    Or(IsBlank(ddSite.Selected.id), IsBlank(txtDescription.Text)),
    Notify("กรุณาระบุ Site และรายละเอียดอาการเสีย", NotificationType.Error),
    Set(varSubmitting, true);
    Set(varResult, CmmsApi.CreateTicket({site_id: ddSite.Selected.id, asset_id: ddAsset.Selected.id, description: txtDescription.Text, priority: ddPriority.Selected.Value}));
    Set(varSubmitting, false);
    If(IsError(varResult), Notify("บันทึกไม่สำเร็จ", NotificationType.Error), Notify("สร้าง Ticket สำเร็จ", NotificationType.Success))
)
```

ต้องใช้ Custom Connector หรือ Power Automate เป็น integration layer และไม่ส่ง service role key จาก Canvas App
