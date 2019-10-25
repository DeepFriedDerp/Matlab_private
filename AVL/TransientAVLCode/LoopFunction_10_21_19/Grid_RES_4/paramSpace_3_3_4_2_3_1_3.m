function [aeroForces] = paramSpace_3_3_4_2_3_1_3(sailStates,airStates)

	CL = (4.539231)*sailStates.alpha + (0.051405)*sailStates.beta + (-2.949855)*sailStates.p + (37.002537)*sailStates.q + (-0.809800)*sailStates.r + (0.010952)*sailStates.de;
	CD = -0.494710;
	CY = (-0.000407)*sailStates.alpha + (-0.025285)*sailStates.beta + (-0.486685)*sailStates.p + (0.668511)*sailStates.q + (0.031970)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.611891)*sailStates.alpha + (0.233142)*sailStates.beta + (-1.516562)*sailStates.p + (12.302369)*sailStates.q + (-0.801159)*sailStates.r + (0.000852)*sailStates.de;
	Cm = (-15.037369)*sailStates.alpha + (-0.178208)*sailStates.beta + (10.406456)*sailStates.p + (-148.601761)*sailStates.q + (2.702293)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (-0.031080)*sailStates.alpha + (-0.012950)*sailStates.beta + (1.177936)*sailStates.p + (-6.302785)*sailStates.q + (-0.018520)*sailStates.r + (-0.000319)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end