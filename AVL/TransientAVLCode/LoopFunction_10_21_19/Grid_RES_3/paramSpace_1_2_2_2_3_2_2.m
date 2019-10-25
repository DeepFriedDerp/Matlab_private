function [aeroForces] = paramSpace_1_2_2_2_3_2_2(sailStates,airStates)

	CL = (4.026386)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.482687)*sailStates.p + (35.353680)*sailStates.q + (-1.075917)*sailStates.r + (0.010747)*sailStates.de;
	CD = 0.028810;
	CY = (0.098144)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.319480)*sailStates.p + (0.759371)*sailStates.q + (-0.056333)*sailStates.r + (0.000162)*sailStates.de;

	Cl = (1.303847)*sailStates.alpha + (0.129449)*sailStates.beta + (-1.162214)*sailStates.p + (9.923305)*sailStates.q + (-0.764632)*sailStates.r + (0.000290)*sailStates.de;
	Cm = (-14.003606)*sailStates.alpha + (0.000000)*sailStates.beta + (8.084908)*sailStates.p + (-134.568695)*sailStates.q + (3.600657)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (-0.025084)*sailStates.alpha + (0.022825)*sailStates.beta + (0.527803)*sailStates.p + (-2.331465)*sailStates.q + (-0.005625)*sailStates.r + (-0.000257)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end