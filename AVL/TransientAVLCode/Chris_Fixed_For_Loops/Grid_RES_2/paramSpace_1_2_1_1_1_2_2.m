function [aeroForces] = paramSpace_1_2_1_1_1_2_2(sailStates,airStates)

	CL = (5.351919)*sailStates.alpha + (-0.772938)*sailStates.beta + (-6.045139)*sailStates.p + (55.411198)*sailStates.q + (2.461455)*sailStates.r + (0.010996)*sailStates.de;
	CD = -7.928850;
	CY = (2.694901)*sailStates.alpha + (-0.017938)*sailStates.beta + (1.404616)*sailStates.p + (4.005728)*sailStates.q + (0.185489)*sailStates.r + (0.000910)*sailStates.de;

	Cl = (-1.242507)*sailStates.alpha + (-0.997844)*sailStates.beta + (-4.149972)*sailStates.p + (35.643158)*sailStates.q + (2.668473)*sailStates.r + (0.005441)*sailStates.de;
	Cm = (6.944345)*sailStates.alpha + (3.265814)*sailStates.beta + (22.624451)*sailStates.p + (-238.694244)*sailStates.q + (-8.346260)*sailStates.r + (-0.082343)*sailStates.de;
	Cn = (-10.103270)*sailStates.alpha + (-0.100097)*sailStates.beta + (-3.802644)*sailStates.p + (16.390781)*sailStates.q + (-0.079096)*sailStates.r + (-0.000706)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end