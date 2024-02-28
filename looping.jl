# Sum the elements of a
function serial_loop( a )
  total = 0

  for x in a
    total += x  # Compute running sum
  end

  return total
end


# Sum the elements of an array in parallel
using Base.Threads

function parallel_loop( a )
  p = zeros(nthreads()) # Somewhere to store the partial sums
  # The @threads macro does the work for us. Dividing the loop evenly 
  # between the threads
  @threads for x in a
    p[threadid()] += x  # Each thread computes a partial sum
  end

  total = sum(p) # Add up the partial sums from each thread.
  return total
end


