function [aeroForces] = paramSpace_1_3_3_1_1_3_1(sailStates,airStates)

	CL = (6.507812)*sailStates.alpha + (-0.144749)*sailStates.beta + (-1.507285)*sailStates.p + (19.787226)*sailStates.q + (2.038237)*sailStates.r + (0.008745)*sailStates.de;
	CD = -2.674380;
	CY = (-0.676402)*sailStates.alpha + (-0.027370)*sailStates.beta + (1.187213)*sailStates.p + (-2.326708)*sailStates.q + (0.236068)*sailStates.r + (-0.000486)*sailStates.de;

	Cl = (1.831255)*sailStates.alpha + (-0.548666)*sailStates.beta + (-0.424698)*sailStates.p + (0.789191)*sailStates.q + (2.056182)*sailStates.r + (-0.000710)*sailStates.de;
	Cm = (-18.515715)*sailStates.alpha + (0.560064)*sailStates.beta + (7.466000)*sailStates.p + (-113.341965)*sailStates.q + (-6.625607)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (2.620116)*sailStates.alpha + (-0.093320)*sailStates.beta + (-2.685765)*sailStates.p + (13.774539)*sailStates.q + (-0.108370)*sailStates.r + (0.000846)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end