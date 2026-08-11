from fastapi import FastAPI, UploadFile, File, HTTPException
import pymupdf as fitz

app = FastAPI(title="Patentability Prediction API")


@app.get("/")
def read_root():
    return {"message": "API çalışıyor"}


@app.post("/upload")
async def upload_pdf(file: UploadFile = File(...)):
    if file.content_type != "application/pdf":
        raise HTTPException(status_code=400, detail="Sadece PDF dosyası kabul edilir.")

    pdf_bytes = await file.read()

    try:
        doc = fitz.open(stream=pdf_bytes, filetype="pdf")
    except Exception:
        raise HTTPException(status_code=400, detail="PDF açılamadı, dosya bozuk olabilir.")

    page_count = len(doc)
    extracted_text = ""
    for page in doc:
        extracted_text += page.get_text()
    doc.close()

    if not extracted_text.strip():
        raise HTTPException(status_code=400, detail="PDF'den metin çıkarılamadı (taranmış görsel olabilir).")

    return {
        "filename": file.filename,
        "page_count": page_count,
        "char_count": len(extracted_text),
        "preview": extracted_text[:500]
    }