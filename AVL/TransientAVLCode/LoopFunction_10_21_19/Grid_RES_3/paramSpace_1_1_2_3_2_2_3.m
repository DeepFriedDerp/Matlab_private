function [aeroForces] = paramSpace_1_1_2_3_2_2_3(sailStates,airStates)

	CL = (3.834951)*sailStates.alpha + (-0.173368)*sailStates.beta + (-2.738696)*sailStates.p + (37.134277)*sailStates.q + (-0.964636)*sailStates.r + (0.010731)*sailStates.de;
	CD = 0.062980;
	CY = (-0.002976)*sailStates.alpha + (-0.025268)*sailStates.beta + (-0.224638)*sailStates.p + (0.173375)*sailStates.q + (-0.039610)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.347171)*sailStates.alpha + (0.045534)*sailStates.beta + (-1.416414)*sailStates.p + (12.331252)*sailStates.q + (-0.681488)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-13.637632)*sailStates.alpha + (0.622532)*sailStates.beta + (9.083528)*sailStates.p + (-141.665955)*sailStates.q + (3.244388)*sailStates.r + (-0.068173)*sailStates.de;
	Cn = (0.217994)*sailStates.alpha + (0.015767)*sailStates.beta + (0.285418)*sailStates.p + (-0.557049)*sailStates.q + (-0.025800)*sailStates.r + (-0.000077)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end