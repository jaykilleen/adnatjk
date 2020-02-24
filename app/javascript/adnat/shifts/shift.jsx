import React from 'react';

const Shift = (props) => {
  return (
    <tr id="shift-{ this.props.shift.id }" className={"" + (this.props.index.odd % 2 ? "bg-gray-100" : "")}>
      <td class="border px-4 py-2">{ this.props.shift.user.name }</td>
      <td class="border px-4 py-2">{ this.props.shift.date }</td>
      <td class="border px-4 py-2">{ this.props.shift.start }</td>
      <td class="border px-4 py-2">{ this.props.shift.finish }</td>
      <td class="border px-4 py-2">{ this.props.shift.break_length }</td>
      <td class="border px-4 py-2">{ this.props.shift.hours_worked }</td>
      <td class="border px-4 py-2">{ this.props.shift.cost }</td>
    </tr>
  );
}

export default Shift;
