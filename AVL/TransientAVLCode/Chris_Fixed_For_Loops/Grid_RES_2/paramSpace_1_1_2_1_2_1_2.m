function [aeroForces] = paramSpace_1_1_2_1_2_1_2(sailStates,airStates)

	CL = (4.204920)*sailStates.alpha + (0.679104)*sailStates.beta + (-6.050558)*sailStates.p + (56.098961)*sailStates.q + (2.125689)*sailStates.r + (0.011062)*sailStates.de;
	CD = -6.742700;
	CY = (2.436717)*sailStates.alpha + (-0.032731)*sailStates.beta + (1.233240)*sailStates.p + (4.139098)*sailStates.q + (0.162652)*sailStates.r + (0.000940)*sailStates.de;

	Cl = (-1.449964)*sailStates.alpha + (-0.662834)*sailStates.beta + (-4.244439)*sailStates.p + (36.988224)*sailStates.q + (2.333011)*sailStates.r + (0.005701)*sailStates.de;
	Cm = (6.894395)*sailStates.alpha + (-2.845191)*sailStates.beta + (22.436905)*sailStates.p + (-238.413864)*sailStates.q + (-7.184528)*sailStates.r + (-0.082294)*sailStates.de;
	Cn = (-9.311226)*sailStates.alpha + (-0.113497)*sailStates.beta + (-3.443995)*sailStates.p + (14.861651)*sailStates.q + (-0.073411)*sailStates.r + (-0.000759)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end