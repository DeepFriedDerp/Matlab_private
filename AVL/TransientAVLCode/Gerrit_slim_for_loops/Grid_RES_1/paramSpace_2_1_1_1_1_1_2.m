function [aeroForces] = paramSpace_2_1_1_1_1_1_2(sailStates,airStates)

	CL = (5.700668)*sailStates.alpha + (-1.810660)*sailStates.beta + (-3.635287)*sailStates.p + (49.749081)*sailStates.q + (2.058056)*sailStates.r + (0.012680)*sailStates.de;
	CD = -5.172600;
	CY = (1.864434)*sailStates.alpha + (-0.117796)*sailStates.beta + (0.230392)*sailStates.p + (14.857200)*sailStates.q + (-0.025070)*sailStates.r + (0.003143)*sailStates.de;

	Cl = (-4.312437)*sailStates.alpha + (-0.963106)*sailStates.beta + (-1.835513)*sailStates.p + (15.802654)*sailStates.q + (2.248976)*sailStates.r + (0.001550)*sailStates.de;
	Cm = (1.098625)*sailStates.alpha + (8.001515)*sailStates.beta + (11.475374)*sailStates.p + (-163.326492)*sailStates.q + (-7.245032)*sailStates.r + (-0.068092)*sailStates.de;
	Cn = (-2.056941)*sailStates.alpha + (0.194155)*sailStates.beta + (-0.713881)*sailStates.p + (-9.030926)*sailStates.q + (-0.182001)*sailStates.r + (-0.004092)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end