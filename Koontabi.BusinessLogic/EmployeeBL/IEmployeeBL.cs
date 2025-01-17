﻿using Koontabi.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Koontabi.BusinessLogic.EmployeeBL
{
    public interface IEmployeeBL : IGenericBL<Employee>
    {
        IEnumerable<Sp_GetEmployeeToComboBox> SpGetEmployeeToComboBox();
        Employee ValidateUserAndPass(String userName, String password);
    }
}
