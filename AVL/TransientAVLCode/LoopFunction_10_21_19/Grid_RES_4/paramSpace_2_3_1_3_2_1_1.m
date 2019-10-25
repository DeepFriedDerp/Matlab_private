function [aeroForces] = paramSpace_2_3_1_3_2_1_1(sailStates,airStates)

	CL = (4.258826)*sailStates.alpha + (0.083324)*sailStates.beta + (-2.323121)*sailStates.p + (33.666233)*sailStates.q + (-0.964385)*sailStates.r + (0.011029)*sailStates.de;
	CD = -0.185930;
	CY = (0.034456)*sailStates.alpha + (-0.025006)*sailStates.beta + (-0.395738)*sailStates.p + (-0.065301)*sailStates.q + (-0.025931)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.159748)*sailStates.alpha + (0.220751)*sailStates.beta + (-0.984348)*sailStates.p + (7.819287)*sailStates.q + (-0.845803)*sailStates.r + (-0.000041)*sailStates.de;
	Cm = (-14.215983)*sailStates.alpha + (-0.347076)*sailStates.beta + (7.738194)*sailStates.p + (-130.047943)*sailStates.q + (3.299773)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (-0.258621)*sailStates.alpha + (0.012888)*sailStates.beta + (0.820506)*sailStates.p + (-3.391032)*sailStates.q + (0.002261)*sailStates.r + (-0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end