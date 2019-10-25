function [aeroForces] = paramSpace_2_1_3_2_2_2_3(sailStates,airStates)

	CL = (3.926191)*sailStates.alpha + (-0.065545)*sailStates.beta + (-2.949469)*sailStates.p + (37.953217)*sailStates.q + (-0.379118)*sailStates.r + (0.011088)*sailStates.de;
	CD = 0.029620;
	CY = (-0.001464)*sailStates.alpha + (-0.024883)*sailStates.beta + (-0.083870)*sailStates.p + (0.100924)*sailStates.q + (-0.005494)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.424641)*sailStates.alpha + (0.011189)*sailStates.beta + (-1.576318)*sailStates.p + (13.364896)*sailStates.q + (-0.261176)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.222598)*sailStates.alpha + (0.206649)*sailStates.beta + (10.034444)*sailStates.p + (-147.195892)*sailStates.q + (1.271434)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (0.100509)*sailStates.alpha + (0.002008)*sailStates.beta + (0.098690)*sailStates.p + (-0.212054)*sailStates.q + (-0.003916)*sailStates.r + (-0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end