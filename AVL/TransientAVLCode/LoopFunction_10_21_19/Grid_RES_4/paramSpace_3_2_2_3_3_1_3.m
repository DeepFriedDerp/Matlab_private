function [aeroForces] = paramSpace_3_2_2_3_3_1_3(sailStates,airStates)

	CL = (4.268114)*sailStates.alpha + (-0.035649)*sailStates.beta + (-2.815016)*sailStates.p + (36.260696)*sailStates.q + (-0.419521)*sailStates.r + (0.011028)*sailStates.de;
	CD = -0.200660;
	CY = (0.019479)*sailStates.alpha + (-0.024837)*sailStates.beta + (-0.310220)*sailStates.p + (0.432842)*sailStates.q + (0.020318)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.472753)*sailStates.alpha + (0.128590)*sailStates.beta + (-1.434747)*sailStates.p + (11.745982)*sailStates.q + (-0.471248)*sailStates.r + (0.000744)*sailStates.de;
	Cm = (-15.010647)*sailStates.alpha + (0.153347)*sailStates.beta + (9.829268)*sailStates.p + (-144.575424)*sailStates.q + (1.428002)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (-0.103081)*sailStates.alpha + (-0.009689)*sailStates.beta + (0.760384)*sailStates.p + (-4.033404)*sailStates.q + (-0.012807)*sailStates.r + (-0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end