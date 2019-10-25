function [aeroForces] = paramSpace_4_1_1_3_3_2_3(sailStates,airStates)

	CL = (3.781573)*sailStates.alpha + (0.169315)*sailStates.beta + (-2.727605)*sailStates.p + (36.997086)*sailStates.q + (0.940999)*sailStates.r + (0.010733)*sailStates.de;
	CD = 0.071510;
	CY = (0.053894)*sailStates.alpha + (-0.023940)*sailStates.beta + (0.151496)*sailStates.p + (0.294837)*sailStates.q + (-0.030166)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.299658)*sailStates.alpha + (-0.021885)*sailStates.beta + (-1.416770)*sailStates.p + (12.378249)*sailStates.q + (0.625821)*sailStates.r + (0.000819)*sailStates.de;
	Cm = (-13.647007)*sailStates.alpha + (-0.525779)*sailStates.beta + (9.101812)*sailStates.p + (-141.543869)*sailStates.q + (-3.142528)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (-0.286082)*sailStates.alpha + (0.011559)*sailStates.beta + (-0.123651)*sailStates.p + (-0.522025)*sailStates.q + (-0.044080)*sailStates.r + (-0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end