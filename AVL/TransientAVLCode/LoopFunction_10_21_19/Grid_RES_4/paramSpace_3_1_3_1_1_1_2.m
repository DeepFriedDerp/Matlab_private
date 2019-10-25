function [aeroForces] = paramSpace_3_1_3_1_1_1_2(sailStates,airStates)

	CL = (5.364599)*sailStates.alpha + (-0.377036)*sailStates.beta + (-2.471984)*sailStates.p + (32.145405)*sailStates.q + (-1.444443)*sailStates.r + (0.010324)*sailStates.de;
	CD = -1.690470;
	CY = (-0.200996)*sailStates.alpha + (-0.026772)*sailStates.beta + (-0.693736)*sailStates.p + (-1.693499)*sailStates.q + (0.045410)*sailStates.r + (-0.000362)*sailStates.de;

	Cl = (1.231308)*sailStates.alpha + (0.318057)*sailStates.beta + (-1.218681)*sailStates.p + (9.644275)*sailStates.q + (-1.475604)*sailStates.r + (0.000430)*sailStates.de;
	Cm = (-14.343447)*sailStates.alpha + (1.504532)*sailStates.beta + (8.987597)*sailStates.p + (-135.354233)*sailStates.q + (4.908429)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (-0.143723)*sailStates.alpha + (-0.028233)*sailStates.beta + (1.686637)*sailStates.p + (-6.712523)*sailStates.q + (-0.008506)*sailStates.r + (0.000333)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end