function [aeroForces] = paramSpace_1_3_3_1_2_2_3(sailStates,airStates)

	CL = (3.564273)*sailStates.alpha + (0.174375)*sailStates.beta + (-3.346734)*sailStates.p + (42.187550)*sailStates.q + (-1.167340)*sailStates.r + (0.011164)*sailStates.de;
	CD = 0.067030;
	CY = (-0.027001)*sailStates.alpha + (-0.023492)*sailStates.beta + (-0.271391)*sailStates.p + (0.589407)*sailStates.q + (-0.047797)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (1.273037)*sailStates.alpha + (0.184037)*sailStates.beta + (-1.829888)*sailStates.p + (16.018072)*sailStates.q + (-0.810933)*sailStates.r + (0.001364)*sailStates.de;
	Cm = (-12.851799)*sailStates.alpha + (-0.550928)*sailStates.beta + (11.072905)*sailStates.p + (-158.590927)*sailStates.q + (3.886841)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (0.417817)*sailStates.alpha + (0.022499)*sailStates.beta + (0.321135)*sailStates.p + (-0.838851)*sailStates.q + (-0.029795)*sailStates.r + (-0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end