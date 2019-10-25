function [aeroForces] = paramSpace_4_1_3_1_2_3_1(sailStates,airStates)

	CL = (6.188944)*sailStates.alpha + (0.690240)*sailStates.beta + (-1.778790)*sailStates.p + (35.704803)*sailStates.q + (2.891710)*sailStates.r + (0.011587)*sailStates.de;
	CD = -2.352060;
	CY = (-0.341710)*sailStates.alpha + (-0.022610)*sailStates.beta + (1.153857)*sailStates.p + (0.662183)*sailStates.q + (-0.229493)*sailStates.r + (0.000137)*sailStates.de;

	Cl = (1.379240)*sailStates.alpha + (-0.418682)*sailStates.beta + (-0.555515)*sailStates.p + (5.783685)*sailStates.q + (2.500665)*sailStates.r + (-0.000648)*sailStates.de;
	Cm = (-8.943126)*sailStates.alpha + (-2.639352)*sailStates.beta + (3.880641)*sailStates.p + (-109.940704)*sailStates.q + (-9.571891)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (1.910589)*sailStates.alpha + (0.126944)*sailStates.beta + (-2.575106)*sailStates.p + (10.918186)*sailStates.q + (0.036692)*sailStates.r + (-0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end