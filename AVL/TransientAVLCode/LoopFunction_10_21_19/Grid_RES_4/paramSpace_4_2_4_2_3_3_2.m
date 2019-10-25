function [aeroForces] = paramSpace_4_2_4_2_3_3_2(sailStates,airStates)

	CL = (4.217610)*sailStates.alpha + (0.149534)*sailStates.beta + (-2.578575)*sailStates.p + (38.832829)*sailStates.q + (1.828435)*sailStates.r + (0.011221)*sailStates.de;
	CD = -0.357600;
	CY = (0.102032)*sailStates.alpha + (-0.024093)*sailStates.beta + (0.591920)*sailStates.p + (0.756269)*sailStates.q + (-0.117659)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.196322)*sailStates.alpha + (-0.285764)*sailStates.beta + (-1.216645)*sailStates.p + (11.020312)*sailStates.q + (1.505291)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-11.771787)*sailStates.alpha + (-0.587689)*sailStates.beta + (7.747033)*sailStates.p + (-135.926239)*sailStates.q + (-6.124785)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (-0.119462)*sailStates.alpha + (0.063984)*sailStates.beta + (-1.150991)*sailStates.p + (3.718850)*sailStates.q + (-0.022776)*sailStates.r + (-0.000133)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end