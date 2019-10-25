function [aeroForces] = paramSpace_1_1_2_3_2_3_3(sailStates,airStates)

	CL = (3.831614)*sailStates.alpha + (-0.074814)*sailStates.beta + (-2.661657)*sailStates.p + (34.845421)*sailStates.q + (-0.422812)*sailStates.r + (0.010096)*sailStates.de;
	CD = -0.047610;
	CY = (0.028472)*sailStates.alpha + (-0.025426)*sailStates.beta + (0.044896)*sailStates.p + (0.194782)*sailStates.q + (0.008923)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.344740)*sailStates.alpha + (-0.062039)*sailStates.beta + (-1.391213)*sailStates.p + (11.793176)*sailStates.q + (-0.162648)*sailStates.r + (0.000786)*sailStates.de;
	Cm = (-14.099219)*sailStates.alpha + (0.261300)*sailStates.beta + (9.346205)*sailStates.p + (-140.845245)*sailStates.q + (1.475775)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (0.208034)*sailStates.alpha + (-0.012834)*sailStates.beta + (-0.358291)*sailStates.p + (2.477604)*sailStates.q + (-0.048584)*sailStates.r + (-0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end