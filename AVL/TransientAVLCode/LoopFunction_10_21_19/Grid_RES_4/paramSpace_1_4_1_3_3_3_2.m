function [aeroForces] = paramSpace_1_4_1_3_3_3_2(sailStates,airStates)

	CL = (3.798394)*sailStates.alpha + (0.098301)*sailStates.beta + (-2.395904)*sailStates.p + (32.837280)*sailStates.q + (-0.455291)*sailStates.r + (0.009884)*sailStates.de;
	CD = -0.002330;
	CY = (0.059449)*sailStates.alpha + (-0.023075)*sailStates.beta + (-0.016256)*sailStates.p + (0.489619)*sailStates.q + (-0.003286)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.104774)*sailStates.alpha + (0.015978)*sailStates.beta + (-1.081757)*sailStates.p + (8.651324)*sailStates.q + (-0.187249)*sailStates.r + (0.000167)*sailStates.de;
	Cm = (-13.979252)*sailStates.alpha + (-0.403342)*sailStates.beta + (8.359670)*sailStates.p + (-133.122269)*sailStates.q + (1.592121)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (0.139379)*sailStates.alpha + (0.001210)*sailStates.beta + (-0.177443)*sailStates.p + (1.167172)*sailStates.q + (-0.029901)*sailStates.r + (-0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end