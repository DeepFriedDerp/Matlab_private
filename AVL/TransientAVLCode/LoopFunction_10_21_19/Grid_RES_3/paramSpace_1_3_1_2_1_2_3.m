function [aeroForces] = paramSpace_1_3_1_2_1_2_3(sailStates,airStates)

	CL = (3.674800)*sailStates.alpha + (0.179865)*sailStates.beta + (-2.895724)*sailStates.p + (38.243103)*sailStates.q + (-0.830535)*sailStates.r + (0.010701)*sailStates.de;
	CD = 0.095450;
	CY = (-0.084869)*sailStates.alpha + (-0.026191)*sailStates.beta + (-0.138057)*sailStates.p + (-0.491414)*sailStates.q + (-0.024296)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.203089)*sailStates.alpha + (0.138548)*sailStates.beta + (-1.456920)*sailStates.p + (12.317725)*sailStates.q + (-0.578283)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-13.226772)*sailStates.alpha + (-0.721567)*sailStates.beta + (9.751667)*sailStates.p + (-146.474228)*sailStates.q + (2.842921)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.297675)*sailStates.alpha + (0.020900)*sailStates.beta + (0.087038)*sailStates.p + (0.938564)*sailStates.q + (-0.041609)*sailStates.r + (0.000145)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end