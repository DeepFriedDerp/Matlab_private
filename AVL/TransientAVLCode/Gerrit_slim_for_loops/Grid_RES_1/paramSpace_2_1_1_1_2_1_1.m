function [aeroForces] = paramSpace_2_1_1_1_2_1_1(sailStates,airStates)

	CL = (6.115971)*sailStates.alpha + (-1.977521)*sailStates.beta + (-3.724834)*sailStates.p + (51.189758)*sailStates.q + (2.357996)*sailStates.r + (0.012926)*sailStates.de;
	CD = -6.259760;
	CY = (1.999490)*sailStates.alpha + (-0.121565)*sailStates.beta + (0.343280)*sailStates.p + (15.455276)*sailStates.q + (-0.039721)*sailStates.r + (0.003274)*sailStates.de;

	Cl = (-5.225595)*sailStates.alpha + (-1.081091)*sailStates.beta + (-1.894849)*sailStates.p + (16.478209)*sailStates.q + (2.545143)*sailStates.r + (0.001651)*sailStates.de;
	Cm = (3.697182)*sailStates.alpha + (8.668004)*sailStates.beta + (11.599544)*sailStates.p + (-165.415268)*sailStates.q + (-8.259734)*sailStates.r + (-0.068346)*sailStates.de;
	Cn = (-2.312256)*sailStates.alpha + (0.206984)*sailStates.beta + (-0.980139)*sailStates.p + (-8.304889)*sailStates.q + (-0.185301)*sailStates.r + (-0.004231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end