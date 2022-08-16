Attribute VB_Name = "Module1"
Sub Multiple_Year_Stock_Data()

    Dim ColumnNames() As Variant
    Dim ws As Worksheet
    Dim wb As Workbook
    Set wb = ActiveWorkbook
    
    'Setting Column Names
    ColumnNames() = Array("<ticker>", "<date>", "<open>", "<high>", "<low>", "<close>", "<vol>", " ", "Ticker", "Yearly Change", "Percentage Change", "Total Stock Volume", " ", " ", " ", "Ticker", "Value")
    
    For Each ws In wb.Sheets
            With ws
            .Rows(1).Value = ""
                For i = LBound(ColumnNames()) To UBound(ColumnNames())
                    .Cells(1, 1 + i) = ColumnNames(i)
                Next i

            End With
    Next ws
    
    For Each ws In Worksheets
    
        'Ticker T
        Dim T As String
        T = " "
        
        'Yearly Change YC
        Dim YC As Double
        YC = 0
        
        'Percentage Change PC
        Dim PC As Double
        PC = 0
        
        'Total Stock Volume TSV
        Dim TSV As Double
        TSV = 0
        
        'Opening Price OP
        Dim OP As Double
        OP = 0
        
        'Closing Price CP
        Dim CP As Double
        CP = 0
        
        Dim High As Double
        High = 0
        
        Dim Low As Double
        Low = 0
        
        'Greatest Percentage Increase Ticker GPIT
        Dim GPIT As String
        GPIT = " "
        
        'Greatest Percentage Decrease Ticker GPDT
        Dim GPDT As String
        GPDT = " "
        
        'Greatest Total Volume Ticker GTVT
        Dim GTVT As String
        GTVT = " "
        
        'Greatest Percentage Increase Value GPIV
        Dim GPIV As Double
        GPIV = 0
        
        'Greatest Percentage Decrease Value GPDV
        Dim GPDV As Double
        GPDV = 0
        
        'Greatest Total Volume Value GTVV
        Dim GTVV As Double
        GTVV = 0
        
        'Results R
        Dim R As Integer
        R = 2
        
        'Last Row
        Dim LR As Long
        LR = ws.Cells(Rows.Count, 1).End(xlUp).Row
        
        'Set opening price to the first value
        OP = ws.Cells(2, 3).Value
        
        For i = 2 To LR
            'Check if the next Ticker is different to the current one
            If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
                T = ws.Cells(i, 1).Value
                CP = ws.Cells(i, 6).Value
             
                YC = CP - OP
                
                If OP <> 0 Then
                    PC = (YC / OP) * 100
                End If
                
                TSV = TSV + ws.Cells(i, 7).Value
              
                ws.Cells(R, 9).Value = T
                ws.Cells(R, 10).Value = YC
                
                'Set color based on yearly change
                If (YC > 0) Then
                      ws.Cells(R, 10).Interior.ColorIndex = 4
                ElseIf (YC <= 0) Then
                      ws.Cells(R, 10).Interior.ColorIndex = 3
                End If
                
                'Calculate percentage change and populate stock volume
                ws.Cells(R, 11).Value = (CStr(PC) & "%")
                ws.Cells(R, 12).Value = TSV
                
                R = R + 1
                
                OP = ws.Cells(i + 1, 3).Value
                
                'Check for highest and lowest percentage and update
                If (PC > GPIV) Then
                    GPIV = PC
                    GPIT = T
                ElseIf (PC < GPDV) Then
                    GPDV = PC
                    GPDT = T
                End If
                'Check for highest value and update
                If (TSV > GTVV) Then
                    GTVV = TSV
                    GTVT = T
                End If
                
                PC = 0
                TSV = 0
                
            Else
                'Keep adding to Total Stock Volume until change in ticker
                TSV = TSV + ws.Cells(i, 7).Value
            End If
        Next i
             
        'Final results
        
        ws.Range("O2").Value = "Greatest % Increase"
        ws.Range("O3").Value = "Greatest % Decrease"
        ws.Range("O4").Value = "Greatest Total Volume"
        ws.Range("P2").Value = GPIT
        ws.Range("P3").Value = GPDT
        ws.Range("P4").Value = GTVT
        ws.Range("Q2").Value = (CStr(GPIV) & "%")
        ws.Range("Q3").Value = (CStr(GPDV) & "%")
        ws.Range("Q4").Value = GTVV

    Next ws
            
   
End Sub
