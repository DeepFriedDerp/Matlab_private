function [aeroForces] = paramSpace_1_3_3_2_1_1_1(sailStates,airStates)

	CL = (4.251640)*sailStates.alpha + (0.128460)*sailStates.beta + (-2.192547)*sailStates.p + (35.433056)*sailStates.q + (-1.655634)*sailStates.r + (0.011208)*sailStates.de;
	CD = -0.361090;
	CY = (-0.052493)*sailStates.alpha + (-0.026064)*sailStates.beta + (-0.515163)*sailStates.p + (-1.057313)*sailStates.q + (-0.102510)*sailStates.r + (-0.000223)*sailStates.de;

	Cl = (0.951465)*sailStates.alpha + (0.333511)*sailStates.beta + (-0.867752)*sailStates.p + (7.556097)*sailStates.q + (-1.324586)*sailStates.r + (-0.000169)*sailStates.de;
	Cm = (-12.007593)*sailStates.alpha + (-0.475075)*sailStates.beta + (6.515067)*sailStates.p + (-125.069839)*sailStates.q + (5.509915)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (-0.312779)*sailStates.alpha + (0.059887)*sailStates.beta + (1.077062)*sailStates.p + (-3.696551)*sailStates.q + (-0.014865)*sailStates.r + (0.000213)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end