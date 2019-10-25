function [aeroForces] = paramSpace_2_2_1_3_2_3_3(sailStates,airStates)

	CL = (4.140829)*sailStates.alpha + (0.015175)*sailStates.beta + (-2.809469)*sailStates.p + (36.321526)*sailStates.q + (0.271169)*sailStates.r + (0.010965)*sailStates.de;
	CD = -0.118990;
	CY = (0.029602)*sailStates.alpha + (-0.025006)*sailStates.beta + (0.199598)*sailStates.p + (0.065300)*sailStates.q + (0.013075)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.406675)*sailStates.alpha + (-0.096986)*sailStates.beta + (-1.431365)*sailStates.p + (11.756193)*sailStates.q + (0.316544)*sailStates.r + (0.000733)*sailStates.de;
	Cm = (-14.741425)*sailStates.alpha + (-0.040527)*sailStates.beta + (9.765111)*sailStates.p + (-144.341232)*sailStates.q + (-0.887235)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (0.062925)*sailStates.alpha + (-0.007238)*sailStates.beta + (-0.550544)*sailStates.p + (2.891831)*sailStates.q + (-0.009427)*sailStates.r + (0.000050)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end