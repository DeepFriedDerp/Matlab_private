function [aeroForces] = paramSpace_2_4_2_1_3_3_2(sailStates,airStates)

	CL = (5.364599)*sailStates.alpha + (-0.377036)*sailStates.beta + (-2.471984)*sailStates.p + (32.145405)*sailStates.q + (1.444444)*sailStates.r + (0.010324)*sailStates.de;
	CD = -1.690470;
	CY = (0.200996)*sailStates.alpha + (-0.022800)*sailStates.beta + (0.693736)*sailStates.p + (1.693499)*sailStates.q + (0.045410)*sailStates.r + (0.000362)*sailStates.de;

	Cl = (1.073655)*sailStates.alpha + (-0.506883)*sailStates.beta + (-1.120987)*sailStates.p + (8.435717)*sailStates.q + (1.482050)*sailStates.r + (0.000171)*sailStates.de;
	Cm = (-14.343447)*sailStates.alpha + (1.504533)*sailStates.beta + (8.987597)*sailStates.p + (-135.354233)*sailStates.q + (-4.908428)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (0.242275)*sailStates.alpha + (-0.025837)*sailStates.beta + (-1.680233)*sailStates.p + (6.633310)*sailStates.q + (-0.008083)*sailStates.r + (-0.000333)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end