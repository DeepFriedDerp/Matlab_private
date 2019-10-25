function [aeroForces] = paramSpace_13_1_1_2_1_2_1(sailStates,airStates)

	CL = (4.268046)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.321661)*sailStates.p + (35.190449)*sailStates.q + (1.440415)*sailStates.r + (0.011105)*sailStates.de;
	CD = -0.160390;
	CY = (-0.077393)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.468592)*sailStates.p + (-0.261303)*sailStates.q + (-0.082598)*sailStates.r + (-0.000055)*sailStates.de;

	Cl = (1.259468)*sailStates.alpha + (-0.223871)*sailStates.beta + (-1.009560)*sailStates.p + (8.726027)*sailStates.q + (1.098011)*sailStates.r + (0.000038)*sailStates.de;
	Cm = (-13.578774)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.211777)*sailStates.p + (-129.217163)*sailStates.q + (-4.781917)*sailStates.r + (-0.067754)*sailStates.de;
	Cn = (0.225350)*sailStates.alpha + (0.039474)*sailStates.beta + (-0.926946)*sailStates.p + (4.025032)*sailStates.q + (0.000918)*sailStates.r + (0.000160)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end