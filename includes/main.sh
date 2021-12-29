fn_main () {
  if [ "$mr_dir" = 'true' ]; then
    skip
  else
    skip
  fi

  if [ -n "$mlist" ]; then
    echo "Retrieving malware list..."
    sudo dwh -u "$user" --mlist > /mlist.txt
  else
    skip
  fi

  if [ -n "$ll" ]; then
    echo "Retrieving list from Last Login file..."
  else
    skip
  fi

  if [ -n "$user" ]; then
    echo "Finding user details..."
  else
    skip
  fi

  if [ -n "$domain" ]; then
    echo "Finding domain details..."
  else
    skip
  fi

  if [ -n "$IP" ]; then
    echo "Finding IP address details..."
  else
    skip
  fi
}
