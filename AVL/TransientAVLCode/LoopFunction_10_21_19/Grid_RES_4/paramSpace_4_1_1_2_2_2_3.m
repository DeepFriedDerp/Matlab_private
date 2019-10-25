function [aeroForces] = paramSpace_4_1_1_2_2_2_3(sailStates,airStates)

	CL = (3.786673)*sailStates.alpha + (0.194222)*sailStates.beta + (-2.849963)*sailStates.p + (38.243340)*sailStates.q + (1.121097)*sailStates.r + (0.010801)*sailStates.de;
	CD = 0.065420;
	CY = (0.004208)*sailStates.alpha + (-0.025650)*sailStates.beta + (0.246153)*sailStates.p + (-0.301043)*sailStates.q + (-0.048930)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.364180)*sailStates.alpha + (-0.032230)*sailStates.beta + (-1.520053)*sailStates.p + (13.484860)*sailStates.q + (0.773587)*sailStates.r + (0.000968)*sailStates.de;
	Cm = (-13.516075)*sailStates.alpha + (-0.608173)*sailStates.beta + (9.376117)*sailStates.p + (-144.677322)*sailStates.q + (-3.728567)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (-0.292746)*sailStates.alpha + (0.017954)*sailStates.beta + (-0.300645)*sailStates.p + (0.619880)*sailStates.q + (-0.034277)*sailStates.r + (0.000138)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end