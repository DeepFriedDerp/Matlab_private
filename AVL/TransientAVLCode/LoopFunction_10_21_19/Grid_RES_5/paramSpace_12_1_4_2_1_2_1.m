function [aeroForces] = paramSpace_12_1_4_2_1_2_1(sailStates,airStates)

	CL = (4.227050)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.340060)*sailStates.p + (34.865036)*sailStates.q + (1.305881)*sailStates.r + (0.010955)*sailStates.de;
	CD = -0.154190;
	CY = (-0.081529)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.480465)*sailStates.p + (-0.291852)*sailStates.q + (-0.067556)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.268551)*sailStates.alpha + (-0.228528)*sailStates.beta + (-1.020316)*sailStates.p + (8.602343)*sailStates.q + (1.061693)*sailStates.r + (0.000043)*sailStates.de;
	Cm = (-13.554855)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.447470)*sailStates.p + (-130.037888)*sailStates.q + (-4.414163)*sailStates.r + (-0.068518)*sailStates.de;
	Cn = (0.243043)*sailStates.alpha + (0.032118)*sailStates.beta + (-0.941625)*sailStates.p + (3.963651)*sailStates.q + (0.003032)*sailStates.r + (0.000141)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end