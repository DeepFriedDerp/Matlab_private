function [aeroForces] = paramSpace_2_2_2_1_2_1_2(sailStates,airStates)

	CL = (5.512762)*sailStates.alpha + (-4.155465)*sailStates.beta + (-3.509789)*sailStates.p + (48.316841)*sailStates.q + (2.352738)*sailStates.r + (0.010528)*sailStates.de;
	CD = -6.654680;
	CY = (1.867903)*sailStates.alpha + (-0.281513)*sailStates.beta + (0.372050)*sailStates.p + (16.043762)*sailStates.q + (-0.037618)*sailStates.r + (0.003058)*sailStates.de;

	Cl = (-6.121869)*sailStates.alpha + (-1.324442)*sailStates.beta + (-1.712755)*sailStates.p + (14.634551)*sailStates.q + (2.616712)*sailStates.r + (0.001290)*sailStates.de;
	Cm = (7.382087)*sailStates.alpha + (18.930510)*sailStates.beta + (10.842489)*sailStates.p + (-152.917725)*sailStates.q + (-8.364934)*sailStates.r + (-0.055451)*sailStates.de;
	Cn = (-1.978137)*sailStates.alpha + (0.401974)*sailStates.beta + (-1.040889)*sailStates.p + (-8.704078)*sailStates.q + (-0.207828)*sailStates.r + (-0.004012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end