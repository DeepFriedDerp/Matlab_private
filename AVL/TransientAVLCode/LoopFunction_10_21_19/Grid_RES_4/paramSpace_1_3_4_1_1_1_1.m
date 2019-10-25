function [aeroForces] = paramSpace_1_3_4_1_1_1_1(sailStates,airStates)

	CL = (5.347457)*sailStates.alpha + (0.197244)*sailStates.beta + (-1.847860)*sailStates.p + (35.603485)*sailStates.q + (-2.458068)*sailStates.r + (0.011934)*sailStates.de;
	CD = -1.779740;
	CY = (-0.001941)*sailStates.alpha + (-0.027209)*sailStates.beta + (-0.862540)*sailStates.p + (-2.326710)*sailStates.q + (-0.171820)*sailStates.r + (-0.000486)*sailStates.de;

	Cl = (0.530806)*sailStates.alpha + (0.573496)*sailStates.beta + (-0.532515)*sailStates.p + (4.975410)*sailStates.q + (-2.098077)*sailStates.r + (-0.000710)*sailStates.de;
	Cm = (-8.856287)*sailStates.alpha + (-0.731607)*sailStates.beta + (4.529117)*sailStates.p + (-113.341965)*sailStates.q + (8.139104)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (-1.401167)*sailStates.alpha + (0.103541)*sailStates.beta + (1.989053)*sailStates.p + (-7.270998)*sailStates.q + (-0.000425)*sailStates.r + (0.000512)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end