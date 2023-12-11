const bodyParser = require("body-parser");
const express = require("express");
const { notFound, errorHandler } = require("./middlewares/errorHandler");
const dbConnect = require('./config/dbConnect');
const dotenv = require("dotenv").config();
const cookieParser = require('cookie-parser');
const morgan = require('morgan');
const cors = require('cors');
const marketerRouter = require("./routes/marketerRouter");
const sellerRouter = require("./routes/sellerRouter");
const adminRouter = require("./routes/adminRouter");
const categoryRouter = require("./routes/categoryRouter");
const requestRouter = require("./routes/requestRouter");
const transactionRouter = require("./routes/transactionRouter");
const orderRouter = require("./routes/orderRouter");
const brandRouter = require("./routes/brandRouter");

const app = express();
dbConnect();
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use("/api/admin", adminRouter);
app.use("/api/category", categoryRouter);
app.use("/api/order", orderRouter);
app.use("/api/brand", brandRouter);
app.use("/api/product", categoryRouter);
app.use("/api/request", requestRouter);
app.use("/api/transaction", transactionRouter);
// app.use("/api/marketer", marketerRouter);
// app.use("/api/seller", sellerRouter);

app.use(cookieParser());
app.use(morgan('dev'))


app.listen(process.env.PORT, () => {
  console.log(`Server is running  at PORT  ${process.env.PORT}`);
});
