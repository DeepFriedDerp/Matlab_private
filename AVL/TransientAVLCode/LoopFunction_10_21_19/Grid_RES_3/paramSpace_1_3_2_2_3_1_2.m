function [aeroForces] = paramSpace_1_3_2_2_3_1_2(sailStates,airStates)

	CL = (4.804492)*sailStates.alpha + (0.397219)*sailStates.beta + (-2.534758)*sailStates.p + (38.321781)*sailStates.q + (-2.089539)*sailStates.r + (0.011235)*sailStates.de;
	CD = -0.637150;
	CY = (0.104389)*sailStates.alpha + (-0.022918)*sailStates.beta + (-0.788749)*sailStates.p + (0.759370)*sailStates.q + (-0.139078)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.582383)*sailStates.alpha + (0.481006)*sailStates.beta + (-1.133779)*sailStates.p + (10.172567)*sailStates.q + (-1.700562)*sailStates.r + (0.000172)*sailStates.de;
	Cm = (-12.873714)*sailStates.alpha + (-1.476032)*sailStates.beta + (7.433430)*sailStates.p + (-133.652283)*sailStates.q + (6.956430)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (-0.228852)*sailStates.alpha + (0.059430)*sailStates.beta + (1.600827)*sailStates.p + (-7.221927)*sailStates.q + (0.017665)*sailStates.r + (-0.000344)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end