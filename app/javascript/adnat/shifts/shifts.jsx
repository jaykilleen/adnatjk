import Axios from 'axios';
import React, { useEffect, useState } from 'react';
import Shift from './shift'

const Shifts = () => {
  const [shifts, setShifts] = useState({ loading: true, data: [] });

  useEffect(() => {
    const url = "http://localhost:3000/shifts.json";
    Axios.get(url)
      .then(res => {
        if (res.data.status == "OK") {
          setShifts({ loading: false, data: res.data.shifts });
        }
      })
      .catch(error => {
        console.log(error);
        setShifts({ loading: false, data: [] });
      })
    },
    []
  )

  const { loading, data } = shifts;
  return (
    <div className="">
      { loading ?
        "Loading ..."
        :
        <div className="pt-8">
          <h3 className="text-2xl pt-8 pb-2">Shifts</h3>
          <table className="table-fixed">
            <thead>
              <tr>
                <th className="px-4 py-2">Employee Name</th>
                <th className="px-4 py-2">Shift Date</th>
                <th className="px-4 py-2">Start Time</th>
                <th className="px-4 py-2">Finish Time</th>
                <th className="px-4 py-2">Break Length (minutes)</th>
                <th className="px-4 py-2">Hours worked</th>
                <th className="px-4 py-2">Shift cost</th>
                <th className=""></th>
                <th className=""></th>
              </tr>
            </thead>
            <tbody>
              {data.map((record, index) => {
                <Shift shift={record} />
              })}
            </tbody>
          </table>
        </div>
      }
    </div>
  );
}

export default Shifts;
