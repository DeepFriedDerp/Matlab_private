function [aeroForces] = paramSpace_3_2_2_2_3_1_3(sailStates,airStates)

	CL = (4.602406)*sailStates.alpha + (-0.065870)*sailStates.beta + (-2.950415)*sailStates.p + (36.969139)*sailStates.q + (-0.828487)*sailStates.r + (0.011014)*sailStates.de;
	CD = -0.537260;
	CY = (-0.005440)*sailStates.alpha + (-0.024761)*sailStates.beta + (-0.516858)*sailStates.p + (0.668511)*sailStates.q + (0.033853)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.668166)*sailStates.alpha + (0.213528)*sailStates.beta + (-1.549478)*sailStates.p + (12.704743)*sailStates.q + (-0.847654)*sailStates.r + (0.000940)*sailStates.de;
	Cm = (-15.184174)*sailStates.alpha + (0.270738)*sailStates.beta + (10.413628)*sailStates.p + (-148.601746)*sailStates.q + (2.811714)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (0.003021)*sailStates.alpha + (-0.016135)*sailStates.beta + (1.224661)*sailStates.p + (-6.352222)*sailStates.q + (-0.018067)*sailStates.r + (-0.000294)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end