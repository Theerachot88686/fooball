const prisma = require("../config/prisma");

exports.getUserById = (id) => {
  return prisma.Customer.findFirst({
    where: {
      id,
    },
  });
};

exports.getUserByEmail = (email) => {
  return prisma.Customer.findFirst({
    where: {
      email,
    },
  });
};

exports.createUser = (email, password) => {
  return prisma.Customer.create({
    data: {
      email,
      password,
    },
  });
};
