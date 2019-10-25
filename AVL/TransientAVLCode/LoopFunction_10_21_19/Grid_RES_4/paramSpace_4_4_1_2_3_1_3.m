function [aeroForces] = paramSpace_4_4_1_2_3_1_3(sailStates,airStates)

	CL = (4.218776)*sailStates.alpha + (0.069622)*sailStates.beta + (-2.795063)*sailStates.p + (34.516411)*sailStates.q + (-0.095199)*sailStates.r + (0.010094)*sailStates.de;
	CD = -0.421100;
	CY = (-0.007122)*sailStates.alpha + (-0.026093)*sailStates.beta + (-0.342742)*sailStates.p + (0.455225)*sailStates.q + (0.068127)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (1.399934)*sailStates.alpha + (0.156716)*sailStates.beta + (-1.415119)*sailStates.p + (11.306490)*sailStates.q + (-0.352509)*sailStates.r + (0.000763)*sailStates.de;
	Cm = (-15.027725)*sailStates.alpha + (-0.388023)*sailStates.beta + (10.303952)*sailStates.p + (-145.756409)*sailStates.q + (0.259249)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (-0.187717)*sailStates.alpha + (-0.019485)*sailStates.beta + (1.000554)*sailStates.p + (-5.646003)*sailStates.q + (-0.073183)*sailStates.r + (-0.000191)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end