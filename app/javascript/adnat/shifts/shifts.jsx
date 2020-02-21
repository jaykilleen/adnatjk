import Axios from 'axios';
import React, { useEffect, useState } from 'react';

const Shifts = () => {
  const [shifts, setShifts] = useState({ loading: true, data: [] });

  useEffect(() => {
    const url = process.env.REACT_APP_URL_API + "shifts";
    Axios.get(url)
      .then(res => {
        if (res.data.status) {
          setShifts({ loading: false, data: res.data.data });
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
    <div className="container mx-auto max-w-3xl px-6 py-4 my-10 rounded border-gray-300 border shadow bg-gray-100">
      { loading ?
        "Loading ..."
        :
        <div className="">
          <h1 className="text-2xl">{ data }</h1>
        </div>
      }
    </div>
  );
}

export default Shifts;
