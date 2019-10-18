function [aeroForces] = paramSpace_1_2_2_2_1_2_1(sailStates,airStates)

	CL = (7.515892)*sailStates.alpha + (-0.523760)*sailStates.beta + (-2.562275)*sailStates.p + (29.653307)*sailStates.q + (0.277074)*sailStates.r + (0.008909)*sailStates.de;
	CD = -4.482700;
	CY = (1.819572)*sailStates.alpha + (-0.005660)*sailStates.beta + (-0.219811)*sailStates.p + (14.830183)*sailStates.q + (-0.024737)*sailStates.r + (0.003158)*sailStates.de;

	Cl = (-1.663692)*sailStates.alpha + (-0.499529)*sailStates.beta + (-1.353723)*sailStates.p + (11.129136)*sailStates.q + (0.938268)*sailStates.r + (0.000321)*sailStates.de;
	Cm = (-13.326397)*sailStates.alpha + (2.569804)*sailStates.beta + (9.221565)*sailStates.p + (-137.711426)*sailStates.q + (-1.195854)*sailStates.r + (-0.068364)*sailStates.de;
	Cn = (-1.879744)*sailStates.alpha + (-0.072373)*sailStates.beta + (-0.082675)*sailStates.p + (-10.379819)*sailStates.q + (0.127302)*sailStates.r + (-0.004215)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end