function [aeroForces] = paramSpace_1_2_3_3_2_3_1(sailStates,airStates)

	CL = (4.049169)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.205959)*sailStates.p + (30.981146)*sailStates.q + (-0.120442)*sailStates.r + (0.010323)*sailStates.de;
	CD = -0.111760;
	CY = (-0.037869)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.153019)*sailStates.p + (-0.173374)*sailStates.q + (0.026965)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.095490)*sailStates.alpha + (-0.069592)*sailStates.beta + (-0.953602)*sailStates.p + (7.358444)*sailStates.q + (0.113029)*sailStates.r + (0.000003)*sailStates.de;
	Cm = (-14.977180)*sailStates.alpha + (0.000000)*sailStates.beta + (7.888864)*sailStates.p + (-128.476028)*sailStates.q + (0.419805)*sailStates.r + (-0.067684)*sailStates.de;
	Cn = (0.292748)*sailStates.alpha + (-0.012271)*sailStates.beta + (-0.466328)*sailStates.p + (2.556005)*sailStates.q + (-0.032878)*sailStates.r + (0.000076)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end