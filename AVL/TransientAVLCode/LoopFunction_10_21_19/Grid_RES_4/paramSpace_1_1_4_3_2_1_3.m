function [aeroForces] = paramSpace_1_1_4_3_2_1_3(sailStates,airStates)

	CL = (4.130640)*sailStates.alpha + (-0.339939)*sailStates.beta + (-2.763086)*sailStates.p + (39.407043)*sailStates.q + (-1.727615)*sailStates.r + (0.011190)*sailStates.de;
	CD = -0.184560;
	CY = (-0.033520)*sailStates.alpha + (-0.025345)*sailStates.beta + (-0.532374)*sailStates.p + (0.194782)*sailStates.q + (-0.105875)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.430027)*sailStates.alpha + (0.140140)*sailStates.beta + (-1.423566)*sailStates.p + (13.018732)*sailStates.q + (-1.342026)*sailStates.r + (0.000786)*sailStates.de;
	Cm = (-12.817156)*sailStates.alpha + (1.169994)*sailStates.beta + (8.501665)*sailStates.p + (-140.845245)*sailStates.q + (5.721566)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (0.296743)*sailStates.alpha + (0.050107)*sailStates.beta + (0.977356)*sailStates.p + (-3.683685)*sailStates.q + (-0.016510)*sailStates.r + (-0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end