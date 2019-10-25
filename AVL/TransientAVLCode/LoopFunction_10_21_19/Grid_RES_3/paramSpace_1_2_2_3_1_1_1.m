function [aeroForces] = paramSpace_1_2_2_3_1_1_1(sailStates,airStates)

	CL = (4.095308)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.307383)*sailStates.p + (35.113316)*sailStates.q + (-1.323407)*sailStates.r + (0.011043)*sailStates.de;
	CD = -0.133920;
	CY = (-0.042945)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.396506)*sailStates.p + (-0.664999)*sailStates.q + (-0.069915)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.080919)*sailStates.alpha + (0.224780)*sailStates.beta + (-0.989499)*sailStates.p + (8.433083)*sailStates.q + (-1.039818)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-12.998689)*sailStates.alpha + (0.000000)*sailStates.beta + (7.257922)*sailStates.p + (-129.097870)*sailStates.q + (4.436160)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-0.103828)*sailStates.alpha + (0.039635)*sailStates.beta + (0.778629)*sailStates.p + (-2.552779)*sailStates.q + (-0.015290)*sailStates.r + (0.000128)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end