function [aeroForces] = paramSpace_1_2_4_2_3_1_3(sailStates,airStates)

	CL = (4.806242)*sailStates.alpha + (-0.153521)*sailStates.beta + (-2.923744)*sailStates.p + (42.238251)*sailStates.q + (-2.344802)*sailStates.r + (0.011678)*sailStates.de;
	CD = -0.636430;
	CY = (0.004678)*sailStates.alpha + (-0.025991)*sailStates.beta + (-0.836569)*sailStates.p + (1.057314)*sailStates.q + (-0.166290)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (1.805123)*sailStates.alpha + (0.323598)*sailStates.beta + (-1.508009)*sailStates.p + (14.155262)*sailStates.q + (-1.879709)*sailStates.r + (0.000840)*sailStates.de;
	Cm = (-12.868390)*sailStates.alpha + (0.537528)*sailStates.beta + (8.510582)*sailStates.p + (-144.624481)*sailStates.q + (7.741047)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (0.416484)*sailStates.alpha + (0.076012)*sailStates.beta + (1.628973)*sailStates.p + (-7.205767)*sailStates.q + (0.009367)*sailStates.r + (-0.000469)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end