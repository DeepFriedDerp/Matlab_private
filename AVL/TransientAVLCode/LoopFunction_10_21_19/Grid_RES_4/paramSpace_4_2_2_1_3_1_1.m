function [aeroForces] = paramSpace_4_2_2_1_3_1_1(sailStates,airStates)

	CL = (6.507812)*sailStates.alpha + (-0.144748)*sailStates.beta + (-1.507285)*sailStates.p + (19.787224)*sailStates.q + (-2.038236)*sailStates.r + (0.008745)*sailStates.de;
	CD = -2.674380;
	CY = (0.676402)*sailStates.alpha + (-0.022582)*sailStates.beta + (-1.187213)*sailStates.p + (2.326708)*sailStates.q + (0.236068)*sailStates.r + (0.000486)*sailStates.de;

	Cl = (1.899020)*sailStates.alpha + (0.453121)*sailStates.beta + (-0.456241)*sailStates.p + (1.186160)*sailStates.q + (-2.049922)*sailStates.r + (-0.000626)*sailStates.de;
	Cm = (-18.515717)*sailStates.alpha + (0.560064)*sailStates.beta + (7.466001)*sailStates.p + (-113.341965)*sailStates.q + (6.625607)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (-2.588145)*sailStates.alpha + (-0.105948)*sailStates.beta + (2.692039)*sailStates.p + (-13.853500)*sailStates.q + (-0.109616)*sailStates.r + (-0.000846)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end