function [aeroForces] = paramSpace_2_3_3_3_1_3_3(sailStates,airStates)

	CL = (4.268114)*sailStates.alpha + (-0.035649)*sailStates.beta + (-2.815016)*sailStates.p + (36.260696)*sailStates.q + (0.419521)*sailStates.r + (0.011028)*sailStates.de;
	CD = -0.200660;
	CY = (-0.019479)*sailStates.alpha + (-0.025115)*sailStates.beta + (0.310220)*sailStates.p + (-0.432842)*sailStates.q + (0.020318)*sailStates.r + (-0.000094)*sailStates.de;

	Cl = (1.425251)*sailStates.alpha + (-0.146507)*sailStates.beta + (-1.402098)*sailStates.p + (11.342102)*sailStates.q + (0.473374)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-15.010649)*sailStates.alpha + (0.153347)*sailStates.beta + (9.829268)*sailStates.p + (-144.575439)*sailStates.q + (-1.428002)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (0.112024)*sailStates.alpha + (-0.008342)*sailStates.beta + (-0.758244)*sailStates.p + (4.006932)*sailStates.q + (-0.012668)*sailStates.r + (0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end