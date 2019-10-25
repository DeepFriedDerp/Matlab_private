function [aeroForces] = paramSpace_3_2_4_3_2_3_1(sailStates,airStates)

	CL = (4.258826)*sailStates.alpha + (0.083324)*sailStates.beta + (-2.323121)*sailStates.p + (33.666233)*sailStates.q + (0.964385)*sailStates.r + (0.011029)*sailStates.de;
	CD = -0.185930;
	CY = (-0.034456)*sailStates.alpha + (-0.024946)*sailStates.beta + (0.395738)*sailStates.p + (0.065301)*sailStates.q + (-0.025931)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.212369)*sailStates.alpha + (-0.179697)*sailStates.beta + (-1.016994)*sailStates.p + (8.223164)*sailStates.q + (0.847986)*sailStates.r + (0.000046)*sailStates.de;
	Cm = (-14.215983)*sailStates.alpha + (-0.347076)*sailStates.beta + (7.738194)*sailStates.p + (-130.047943)*sailStates.q + (-3.299773)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.237605)*sailStates.alpha + (0.013359)*sailStates.beta + (-0.818366)*sailStates.p + (3.364560)*sailStates.q + (0.002118)*sailStates.r + (0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end